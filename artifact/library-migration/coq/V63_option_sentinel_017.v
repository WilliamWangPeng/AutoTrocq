(* V63 library-style representation-migration module *)
(* PATTERN: option-sentinel *)
(* TRANSFER_SHAPE: partial encoding *)
(* OBLIGATIONS: 3 *)

Module V63_option_sentinel_017.
Definition enc_17 (o : option nat) : nat :=
  match o with
  | None => 0
  | Some n => S n
  end.

Definition dec_17 (n : nat) : option nat :=
  match n with
  | 0 => None
  | S k => Some k
  end.

Definition size_17 (o : option nat) : nat :=
  match o with None => 0 | Some n => S n end.

Theorem dec_enc_17 : forall o : option nat, dec_17 (enc_17 o) = o.
Proof.
  destruct o; reflexivity.
Qed.

Theorem size_transfer_17 : forall o : option nat, enc_17 o = size_17 o.
Proof.
  destruct o; reflexivity.
Qed.

Theorem none_unique_17 : forall o : option nat, enc_17 o = 0 -> o = None.
Proof.
  destruct o; simpl; congruence.
Qed.
End V63_option_sentinel_017.


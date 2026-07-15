(* V63 library-style representation-migration module *)
(* PATTERN: option-sentinel *)
(* TRANSFER_SHAPE: partial encoding *)
(* OBLIGATIONS: 3 *)

Module V63_option_sentinel_002.
Definition enc_2 (o : option nat) : nat :=
  match o with
  | None => 0
  | Some n => S n
  end.

Definition dec_2 (n : nat) : option nat :=
  match n with
  | 0 => None
  | S k => Some k
  end.

Definition size_2 (o : option nat) : nat :=
  match o with None => 0 | Some n => S n end.

Theorem dec_enc_2 : forall o : option nat, dec_2 (enc_2 o) = o.
Proof.
  destruct o; reflexivity.
Qed.

Theorem size_transfer_2 : forall o : option nat, enc_2 o = size_2 o.
Proof.
  destruct o; reflexivity.
Qed.

Theorem none_unique_2 : forall o : option nat, enc_2 o = 0 -> o = None.
Proof.
  destruct o; simpl; congruence.
Qed.
End V63_option_sentinel_002.


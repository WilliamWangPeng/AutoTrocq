(* V63 library-style representation-migration module *)
(* PATTERN: option-sentinel *)
(* TRANSFER_SHAPE: partial encoding *)
(* OBLIGATIONS: 3 *)

Module V63_option_sentinel_025.
Definition enc_25 (o : option nat) : nat :=
  match o with
  | None => 0
  | Some n => S n
  end.

Definition dec_25 (n : nat) : option nat :=
  match n with
  | 0 => None
  | S k => Some k
  end.

Definition size_25 (o : option nat) : nat :=
  match o with None => 0 | Some n => S n end.

Theorem dec_enc_25 : forall o : option nat, dec_25 (enc_25 o) = o.
Proof.
  destruct o; reflexivity.
Qed.

Theorem size_transfer_25 : forall o : option nat, enc_25 o = size_25 o.
Proof.
  destruct o; reflexivity.
Qed.

Theorem none_unique_25 : forall o : option nat, enc_25 o = 0 -> o = None.
Proof.
  destruct o; simpl; congruence.
Qed.
End V63_option_sentinel_025.


(* V63 library-style representation-migration module *)
(* PATTERN: option-sentinel *)
(* TRANSFER_SHAPE: partial encoding *)
(* OBLIGATIONS: 3 *)

Module V63_option_sentinel_055.
Definition enc_55 (o : option nat) : nat :=
  match o with
  | None => 0
  | Some n => S n
  end.

Definition dec_55 (n : nat) : option nat :=
  match n with
  | 0 => None
  | S k => Some k
  end.

Definition size_55 (o : option nat) : nat :=
  match o with None => 0 | Some n => S n end.

Theorem dec_enc_55 : forall o : option nat, dec_55 (enc_55 o) = o.
Proof.
  destruct o; reflexivity.
Qed.

Theorem size_transfer_55 : forall o : option nat, enc_55 o = size_55 o.
Proof.
  destruct o; reflexivity.
Qed.

Theorem none_unique_55 : forall o : option nat, enc_55 o = 0 -> o = None.
Proof.
  destruct o; simpl; congruence.
Qed.
End V63_option_sentinel_055.

